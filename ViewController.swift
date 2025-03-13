import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionCounterLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!

    // MARK: - Properties
    var questions: [Question] = []
    var currentQuestionIndex: Int = 0
    var score: Int = 0

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        updateUI()
    }

    // MARK: - Setup Questions
    func setupQuestions() {
        questions = [
            Question(text: "What is the capital of France?", answers: ["Berlin", "London", "Paris", "Madrid"], correctAnswerIndex: 2),
            Question(text: "Which planet is known as the Red Planet?", answers: ["Earth", "Mars", "Jupiter", "Venus"], correctAnswerIndex: 1),
            Question(text: "Who wrote 'Romeo and Juliet'?", answers: ["Shakespeare", "Dickens", "Hemingway", "Tolkien"], correctAnswerIndex: 0)
        ]
    }

    // MARK: - Update UI
    func updateUI() {
        restartButton.isHidden = true

        if currentQuestionIndex < questions.count {
            let question = questions[currentQuestionIndex]
            questionLabel.text = question.text
            questionCounterLabel.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"

            answerButton1.setTitle(question.answers[0], for: .normal)
            answerButton2.setTitle(question.answers[1], for: .normal)
            answerButton3.setTitle(question.answers[2], for: .normal)
            answerButton4.setTitle(question.answers[3], for: .normal)
        } else {
            // All questions answered
            questionLabel.text = "You got \(score) out of \(questions.count) correct!"
            questionCounterLabel.text = "Game Over"

            // Hide answer buttons and show restart
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
            restartButton.isHidden = false
        }
    }

    // MARK: - Answer Button Action
    @IBAction func answerTapped(_ sender: UIButton) {
        let question = questions[currentQuestionIndex]

        // Check if answer is correct
        if sender.tag == question.correctAnswerIndex {
            score += 1
        }

        // Go to next question
        currentQuestionIndex += 1
        updateUI()
    }

    // MARK: - Restart Game Action
    @IBAction func restartGame(_ sender: UIButton) {
        // Reset game state
        currentQuestionIndex = 0
        score = 0

        // Show buttons again
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false

        updateUI()
    }
}